using System.ComponentModel.DataAnnotations;
namespace FitFam_API.Model
{
    public class Level
    {
        [Key]
        public int Id { get; set; }
        public string name { get; set; }
        public string img { get; set; }
        public string points { get; set; }
        public Level() { }

    }
}

