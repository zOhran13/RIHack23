using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace FitFam_API.Model
{
    public class MyEvent
    {
        [Key]
        public int Id { get; set; }
        [ForeignKey("Event")]
        public int EventId { get; set; }
        [ForeignKey("User")]
        public int UserId { get; set; }
        public MyEvent() { }
    }
}
