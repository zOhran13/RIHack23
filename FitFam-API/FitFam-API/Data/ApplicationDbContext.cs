using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using FitFam_API.Model;
using System;
using System.Collections.Generic;
using System.Text;

namespace FitFam_API.Data
{
    public class ApplicationDbContext : IdentityDbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
        }

        public DbSet<Achievement> Achievement { get; set; }
        public DbSet<User> Odgovor { get; set; }
        public DbSet<MyAchievement> MyAchievement { get; set; }

        public DbSet<Event> Event { get; set; }

        public DbSet<EventReward> EventReward { get; set; }

        public DbSet<Reward> Reward { get; set; }

        public DbSet<Level> Level { get; set; }

        public DbSet<MyEvent> MyEvent { get; set; }
        public DbSet<MyReward> MyReward { get; set; }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<User>().ToTable("User");
            modelBuilder.Entity<Achievement>().ToTable("Achievement");
            modelBuilder.Entity<MyAchievement>().ToTable("MyAchievement");
            modelBuilder.Entity<Level>().ToTable("Level");
            modelBuilder.Entity<Reward>().ToTable("Reward");
            modelBuilder.Entity<MyReward>().ToTable("MyReward");
            modelBuilder.Entity<Event>().ToTable("Event");
            modelBuilder.Entity<MyEvent>().ToTable("MyEvent");
            modelBuilder.Entity<EventReward>().ToTable("EventReward");
            base.OnModelCreating(modelBuilder);
        }




    }
}
