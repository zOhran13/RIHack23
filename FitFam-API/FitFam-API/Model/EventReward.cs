using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace FitFam_API.Model
{
    public class EventReward
    {
        [Key]
        public int Id { get; set; }
        public string title { get; set; }
        public int place { get; set; }
        [ForeignKey("EventId")]
        public int eventId { get; set; }
        public int points { get; set; }
        public Event Event { get; set; }

        public EventReward() { }

    }
}
