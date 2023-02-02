using BeGeneric.Models;
using Microsoft.EntityFrameworkCore;
using System;

namespace BeGeneric.Context
{
    public class EntityDbContext : DbContext
    {
        public EntityDbContext(DbContextOptions<EntityDbContext> options) : base(options)
        {
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<EmployeeAbsence>().ToTable("EmployeeAbsence", "dbo");

            modelBuilder.Entity<Department>().ToTable("Department", "dbo");

            modelBuilder.Entity<Employee>()
                .HasOne(p => p.Department)
                .WithMany(b => b.EmployeeList);

            modelBuilder.Entity<Employee>().ToTable("Employee", "dbo");

            modelBuilder.Entity<EmployeeAbsence>()
                .HasOne(p => p.Employee)
                .WithMany(b => b.EmployeeAbsenceList);

            modelBuilder.Entity<Employee>()
                .HasOne(p => p.Manager)
                .WithMany(b => b.Subordinates);

            modelBuilder.Entity<Job>().ToTable("Job", "dbo");

            modelBuilder.Entity<Employee>()
                .HasOne(p => p.Job)
                .WithMany(b => b.EmployeeList);

            modelBuilder.Entity<AbsenceCategory>().ToTable("AbsenceCategory", "dbo");

            modelBuilder.Entity<EmployeeAbsence>()
                .HasOne(p => p.AbsenceCategory)
                .WithMany(b => b.EmployeeAbsenceList);

        }

        public DbSet<EmployeeAbsence> EmployeeAbsences { get; set; }

        public DbSet<Department> Departments { get; set; }

        public DbSet<Employee> Managers { get; set; }

        public DbSet<Employee> Employees { get; set; }

        public DbSet<Job> Jobs { get; set; }

        public DbSet<Employee> EmployeeBasicDatas { get; set; }

        public DbSet<AbsenceCategory> AbsenceCategorys { get; set; }

    }
}
