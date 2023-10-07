using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace FitFam_API.Migrations
{
    /// <inheritdoc />
    public partial class FitFam4 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "type",
                table: "Event",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "type",
                table: "Event");
        }
    }
}
