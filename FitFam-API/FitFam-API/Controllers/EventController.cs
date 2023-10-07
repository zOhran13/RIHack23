using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using FitFam_API.Data;
using FitFam_API.Model;

namespace FitFam_API.Controllers
{
    [ApiController]
    [Route("events")]
    public class EventController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        public EventController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: api/events
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Event>>> GetEvents(int userId)
        {
            // Retrieve the events that the user is not assigned to.
            var events = await _context.Event
                .Where(e => !_context.MyEvent.Any(ue => ue.EventId == e.Id && ue.UserId == userId && e.accepted))
                .ToListAsync();

            return Ok(events);
        }

        [HttpGet("user/{userId}/events")]
        public async Task<ActionResult<IEnumerable<Event>>> GetUserEvents(int userId)
        {
            // Retrieve events associated with the user with userId.
            var eventIds = await _context.MyEvent.Where(me => me.UserId == userId).Select(me => me.EventId).ToListAsync();
            var events = await _context.Event
    .Where(e => eventIds.Contains(e.Id))
    .ToListAsync();
            return Ok(events);
        }
        [HttpPost("user/{userId}/events/{eventId}")]
        public async Task<IActionResult> AddUserToEvent(int userId, int eventId)
        {
            // Check if the user and event exist.
            var userExists = await _context.Odgovor.AnyAsync(u => u.Id == userId);
            var eventExists = await _context.Event.AnyAsync(e => e.Id == eventId);

            if (!userExists || !eventExists)
            {
                return NotFound("User or event not found.");
            }

            // Check if the user already has the event.
            var existingRecord = await _context.MyEvent
                .FirstOrDefaultAsync(me => me.UserId == userId && me.EventId == eventId);

            if (existingRecord != null)
            {
                return Conflict("User already has this event.");
            }

            // Create a new MyEvent record to associate the user with the event.
            var myEvent = new MyEvent { UserId = userId, EventId = eventId };
            _context.MyEvent.Add(myEvent);

            // Increase the number of attendees (going) for the event.
            var eventToUpdate = await _context.Event.FirstOrDefaultAsync(e => e.Id == eventId);
            if (eventToUpdate != null)
            {
                eventToUpdate.going++;
            }

            await _context.SaveChangesAsync();

            return Ok("Event added to the user's list.");
        }

        [HttpDelete("event/{eventId}/user/{userId}")]
        public IActionResult RemoveUserFromEvent(int eventId, int userId)
        {
            // Retrieve the MyEvent record that matches the eventId and userId.
            var myEvent = _context.MyEvent
                .FirstOrDefault(me => me.EventId == eventId && me.UserId == userId);

            if (myEvent == null)
            {
                // If the record doesn't exist, return a 404 Not Found response.
                return NotFound();
            }

            // Remove the MyEvent record from the database.
            _context.MyEvent.Remove(myEvent);
            _context.SaveChanges();

            // Return a 204 No Content response to indicate success.
            return NoContent();
        }

        // GET: api/events/{id}
        [HttpGet("{id}")]
        public async Task<ActionResult<Event>> GetEvent(int id)
        {
            var @event = await _context.Event.FindAsync(id);

            if (@event == null)
            {
                return NotFound();
            }

            return Ok(@event);
        }

        // POST: api/events
        [HttpPost]
        public async Task<ActionResult<Event>> CreateEvent(Event @event)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            _context.Event.Add(@event);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetEvent", new { id = @event.Id }, @event);
        }

        // PUT: api/events/{id}
        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateEvent(int id, Event @event)
        {
            if (id != @event.Id)
            {
                return BadRequest();
            }

            _context.Entry(@event).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!EventExists(id))
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

        // DELETE: api/events/{id}
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteEvent(int id)
        {
            var @event = await _context.Event.FindAsync(id);
            if (@event == null)
            {
                return NotFound();
            }

            _context.Event.Remove(@event);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool EventExists(int id)
        {
            return _context.Event.Any(e => e.Id == id);
        }
    }
}
