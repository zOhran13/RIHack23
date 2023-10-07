using System.ComponentModel.DataAnnotations;
namespace FitFam_API.Model
{
    public class User
    {
        [Key]
        public int Id { get; set; }
        public string name { get; set; }
        public string surname { get; set; }
        public string email { get; set; }
        public string username { get; set; }
        public string password { get; set; }
        public int age { get; set; }
        public int points {  get; set; }
        public string profileImage { get; set; }
        public User() { }
    }
}
