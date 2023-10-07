using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Linq;
using Microsoft.EntityFrameworkCore;
using FitFam_API.Data; // Replace with your actual namespace for DbContext and User model.
using FitFam_API.Model;
using Microsoft.CodeAnalysis.Scripting;
using NuGet.Protocol.Plugins;
using System.ComponentModel.DataAnnotations;

namespace FitFam_API.Controllers
{
    [ApiController]
    [Route("user")]
    public class UserController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        public UserController(ApplicationDbContext context)
        {
            _context = context;
        }
      

        [HttpGet]
        public ActionResult<IEnumerable<User>> GetAllUsers()
        {
            // Retrieve all users from the database.
            var users = _context.Odgovor.ToList();
            return Ok(users);
        }

        [HttpGet("{id}")]
        public ActionResult<User> GetUserById(int id)
        {
            // Retrieve a user by their ID from the database.
            var user = _context.Odgovor.FirstOrDefault(u => u.Id == id);

            if (user != null)
            {
                return Ok(user);
            }
            else
            {
                return NotFound();
            }
        }
        [HttpPost("login")]
        public async Task<ActionResult<User>> LoginUser([FromBody] LoginRequest request)
        {
            // Find a user with the provided username (email) in the database.
            var user = await _context.Odgovor.FirstOrDefaultAsync(u => u.username == request.Username);

            if (user != null)
            {
                // Verify the hashed password.
                if (BCrypt.Net.BCrypt.Verify(request.Password, user.password))
                {
                    return Ok(user); // Password is correct, return the user.
                }
            }

            return Unauthorized(); // User not found or password is incorrect.
        }

            [HttpPost("register")]
            public IActionResult Register([FromBody] RegisterRequest model)
            {
                if (model == null)
                {
                    return BadRequest("Invalid request data.");
                }

                // Check if the email is already in use
                var existingUser = _context.Odgovor.FirstOrDefault(u => u.username == model.Username);
                if (existingUser != null)
                {
                    return Conflict("Email is already registered.");
                }

                // Hash the password
                string hashedPassword = BCrypt.Net.BCrypt.HashPassword(model.Password);

            // Create a new user
            var newUser = new User
            {
                name = model.Name,
                surname = model.Surname,
                email = model.Email,
                username = model.Username,
                age = model.Age,
                points = 0, // You can set the initial points here
                profileImage = model.ProfileImage,
                password = hashedPassword // Store the hashed password
            };

            // Add the user to the database
            _context.Odgovor.Add(newUser);
                _context.SaveChanges();

                return Ok("User registered successfully.");
            }



        [HttpPost("points")]
        public IActionResult GetPointsForUser([FromBody] UserIdRequest userIdRequest)
        {
            // Extract the user ID from the request body
            int userId = userIdRequest.UserId;

            // Find the user by their ID
            var user = _context.Odgovor.FirstOrDefault(u => u.Id == userId);

            if (user == null)
            {
                return NotFound("User not found.");
            }

            // Return the points for the user
            return Ok(new { Points = user.points });
        }


        [HttpPost]
        public ActionResult CreateUser([FromBody] User user)
        {
            // Add a new user to the database.
            _context.Odgovor.Add(user);
            _context.SaveChanges();

            return CreatedAtAction(nameof(GetUserById), new { id = user.Id }, user);
        }

        [HttpPut("{id}")]
        public ActionResult UpdateUser(int id, [FromBody] User user)
        {
            // Update an existing user in the database.
            if (id != user.Id)
            {
                return BadRequest();
            }

            _context.Entry(user).State = EntityState.Modified;
            _context.SaveChanges();

            return NoContent();
        }
        [HttpGet("rank")]
        public ActionResult<int> GetRankForUser([FromBody] UserIdRequest userIdRequest)
        {
            // Retrieve the user's rank based on their user ID.
            var allUsers = _context.Odgovor.OrderByDescending(u => u.points).ToList();

            // Find the index of the user with the target user ID.
            int userRank = allUsers.FindIndex(u => u.Id == userIdRequest.UserId);
            int rank = -1;
            // The index is zero-based, so add 1 to get the user's rank (1-based).
            if (userRank >= 0)
            {
                rank= userRank + 1;
            }

            if (rank >= 0)
            {
                return Ok(rank);
            }
            else
            {
                return NotFound();
            }
        }
        [HttpGet("toptenranks")]
        public IActionResult GetTopTenRanks()
        {
            // Retrieve the top ten users based on points.
            var topTenUsers = _context.Odgovor.OrderByDescending(u => u.points).Take(10).ToList();

            // You can return the list of top ten users or any other desired response.
            return Ok(topTenUsers);
        }

        [HttpDelete("{id}")]
        public ActionResult DeleteUser(int id)
        {
            // Delete a user by their ID from the database.
            var user = _context.Odgovor.FirstOrDefault(u => u.Id == id);

            if (user != null)
            {
                _context.Odgovor.Remove(user);
                _context.SaveChanges();
                return NoContent();
            }
            else
            {
                return NotFound();
            }
        }
        [HttpPut("addpoints")]
        public IActionResult SetPointsForUser([FromBody] SetPointsRequest request)
        {
            if (request == null)
            {
                return BadRequest("Invalid request data.");
            }

            // Retrieve the user by their ID from the database.
            var user = _context.Odgovor.FirstOrDefault(u => u.Id == request.UserId);

            if (user == null)
            {
                return NotFound("User not found.");
            }

            // Update the user's points.
            user.points = user.points+request.Points;

            // Save changes to the database.
            _context.SaveChanges();

            return Ok("Points updated successfully.");
        }
        [HttpGet("level")]
        public ActionResult<string> GetLevelForUser([FromBody] UserIdRequest userIdRequest)
        {
            var levels = new Level[]{
    new Level { name = "Level 1", img = "", points = "10" },
    new Level { name = "Level 2", img = "", points = "20" },
    new Level { name = "Level 3", img = "", points = "30" },
    new Level { name = "Level 4", img = "", points = "40" },
    new Level { name = "Level 5", img = "", points = "50" },
    new Level { name = "Level 6", img = "", points = "60" },
    new Level { name = "Level 7", img = "", points = "70" },
    new Level { name = "Level 8", img = "", points = "80" },
    new Level { name = "Level 9", img = "", points = "90" },
    new Level { name = "Level 10", img = "", points = "100" },
    new Level { name = "Level 11", img = "", points = "110" },
    new Level { name = "Level 12", img = "", points = "120" },
    new Level { name = "Level 13", img = "", points = "130" },
    new Level { name = "Level 14", img = "", points = "140" },
    new Level { name = "Level 15", img = "", points = "150" },
    new Level { name = "Level 16", img = "", points = "160" },
    new Level { name = "Level 17", img = "", points = "170" },
    new Level { name = "Level 18", img = "", points = "180" },
    new Level { name = "Level 19", img = "", points = "190" },
    new Level { name = "Level 20", img = "", points = "200" }
};
            var user = _context.Odgovor.FirstOrDefault(u => u.Id == userIdRequest.UserId);
            Level userLevel = null;
            foreach (var level in levels)
            {
                if (int.Parse(level.points) <= user.points)
                {
                    userLevel = level;
                }
                else
                {
                    break;
                }
            }

            if (userLevel != null)
            {
                return Ok(userLevel);
            }
            else
            {
                return NotFound("User level not found.");
            }



        }
        [HttpGet("{userId}/points")]
        public IActionResult GetUserPoints(int userId)
        {
            // Retrieve the user by their ID.
            var user = _context.Odgovor.FirstOrDefault(u => u.Id == userId);

            if (user == null)
            {
                return NotFound("User not found.");
            }

            // Return the user's points.
            return Ok(new { Points = user.points });
        }

        public class LoginRequest
        {
            [Required]
            public string Username { get; set; }

            [Required]
            public string Password { get; set; }
        }
        public class UserIdRequest
        {
            public int UserId { get; set; }
        }
        public class SetPointsRequest
        {
            public int UserId { get; set; }
            public int Points { get; set; }
        }

        public class RegisterRequest
        {
            public string Name { get; set; }
            public string Surname { get; set; }
            public string Email { get; set; }
            public string Username { get; set; }
            public int Age { get; set; }
            public string ProfileImage { get; set; }
            public string Password { get; set; }
        }

    }
}
