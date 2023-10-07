using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using FitFam_API.Data; // Replace with your actual namespace for DbContext and Reward model.
using FitFam_API.Model;
using FitFam_API.Model;

namespace FitFam_API.Controllers
{
    [ApiController]
    [Route("api/rewards")]
    public class RewardsController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        public RewardsController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: api/rewards
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Reward>>> GetAllRewards()
        {
            var rewards = await _context.Reward.ToListAsync();
            return Ok(rewards);
        }

        // GET: api/rewards/{id}
        [HttpGet("{id}")]
        public async Task<ActionResult<Reward>> GetRewardById(int id)
        {
            var reward = await _context.Reward.FindAsync(id);

            if (reward == null)
            {
                return NotFound();
            }

            return Ok(reward);
        }
        [HttpPost("user/{userId}/rewards/{rewardId}")]
        public async Task<IActionResult> AssignRewardToUser(int userId, int rewardId)
        {
            // Check if the user and reward exist.
            var userExists = await _context.Odgovor.AnyAsync(u => u.Id == userId);
            var rewardExists = await _context.Reward.AnyAsync(r => r.Id == rewardId);

            if (!userExists || !rewardExists)
            {
                return NotFound("User or reward not found.");
            }

            // Check if the user already has the reward.
            var existingRecord = await _context.MyReward
                .FirstOrDefaultAsync(mr => mr.idUser == userId && mr.idReward == rewardId);

            if (existingRecord != null)
            {
                return Conflict("User already has this reward.");
            }

            // Retrieve the user's points.
            var user = await _context.Odgovor.FindAsync(userId);

            if (user == null)
            {
                return NotFound("User not found.");
            }

            // Retrieve the reward's required points.
            var reward = await _context.Reward.FindAsync(rewardId);

            if (reward == null)
            {
                return NotFound("Reward not found.");
            }

            // Check if the user has enough points for the reward.
            if (user.points < reward.points)
            {
                return BadRequest("User does not have enough points for this reward.");
            }

            // Deduct the required points from the user's total points.
            user.points -= reward.points;

            // Create a new MyReward record to associate the user with the reward.
            var myReward = new MyReward { idUser = userId, idReward = rewardId };
            _context.MyReward.Add(myReward);

            // Save changes to update the user's points and assign the reward.
            await _context.SaveChangesAsync();

            return Ok("Reward assigned to the user.");
        }

        // POST: api/rewards
        [HttpPost]
        public async Task<ActionResult<Reward>> CreateReward([FromBody] Reward reward)
        {
            _context.Reward.Add(reward);
            await _context.SaveChangesAsync();

            return CreatedAtAction(nameof(GetRewardById), new { id = reward.Id }, reward);
        }

        // PUT: api/rewards/{id}
        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateReward(int id, [FromBody] Reward reward)
        {
            if (id != reward.Id)
            {
                return BadRequest();
            }

            _context.Entry(reward).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!_context.Reward.Any(r => r.Id == id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // DELETE: api/rewards/{id}
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteReward(int id)
        {
            var reward = await _context.Reward.FindAsync(id);

            if (reward == null)
            {
                return NotFound();
            }

            _context.Reward.Remove(reward);
            await _context.SaveChangesAsync();

            return NoContent();
        }
    }
}
