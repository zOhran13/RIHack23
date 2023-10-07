using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace FitFam_API.Model
{
    public class MyReward
    {
        [Key]
        public int id { get; set; }

        [ForeignKey("User")]
        public int idUser { get; set; }
        [ForeignKey("Reward")]
        public int idReward { get; set; }
        public User User { get; set; }
        public Reward Reward { get; set; }
        public MyReward() { }
    }
    

}

