using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace FitFam_API.Model
{
    public class Event
    {
        [Key]
        public int Id { get; set; }
        public string name { get; set; }
        public string description { get; set; }
        public bool accepted {  get; set; }
        public string type { get; set; }
        public DateTime time { get; set; }
        public int capacity { get; set; }
        public int going {  get; set; }
        public int points {  get; set; }

        public Event() { }

    }
}
