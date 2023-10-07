using System.ComponentModel.DataAnnotations;
namespace FitFam_API.Model
{
    public class Reward
    {
        [Key]
        public int Id { get; set; }
        public string title { get; set; }
        public string description { get; set; }
        public string image { get; set; }
        public long code { get; set; }
        public DateTime expirationDate { get; set; }
        public int points { get; set; }
        public Reward() { }
    }
}
