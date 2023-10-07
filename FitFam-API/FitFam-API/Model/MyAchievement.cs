using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace FitFam_API.Model
{
    public class MyAchievement
    {
        [Key]
        public int Id { get; set; }
        [ForeignKey("Achievement")]
        public int AchievementId { get; set; }
        [ForeignKey("User")]
        public int UserId { get; set; }
        public MyAchievement() { }
    }
}
