﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CartagenaGame.BU
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class CartagenaGameModelContainer : DbContext
    {
        public CartagenaGameModelContainer()
            : base("name=CartagenaGameModelContainer")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Game> GameSet { get; set; }
        public virtual DbSet<GameResult> GameResultSet { get; set; }
        public virtual DbSet<Player> PlayerSet { get; set; }
        public virtual DbSet<Move> MoveSet { get; set; }
        public virtual DbSet<Achievement> AchievementSet { get; set; }
        public virtual DbSet<Achieved> AchievedSet { get; set; }
    }
}
