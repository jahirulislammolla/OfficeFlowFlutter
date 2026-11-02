class Project {
    final String id;
    final String name;
    final String description;
    final String status;
    final DateTime startDate;
    final DateTime endDate;
    final List<String> teamMembers;

    const Project({
        required this.id,
        required this.name,
        required this.description,
        required this.status,
        required this.startDate,
        required this.endDate,
        required this.teamMembers,
    }); 
}