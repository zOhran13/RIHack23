using System.ComponentModel.DataAnnotations;
namespace FitFam_API.Model
{
    public class Achievement
    {
        [Key]
        public int Id { get; set; }
        public string name { get; set; }
        public string icon { get; set; }
        public string description { get; set; }
        public int points {  get; set; }
        public Achievement() { }

    }
}

