using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace FitFam_API.Migrations
{
    /// <inheritdoc />
    public partial class FitFam3 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<bool>(
                name: "accepted",
                table: "Event",
                type: "bit",
                nullable: false,
                defaultValue: false);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "accepted",
                table: "Event");
        }
    }
}
