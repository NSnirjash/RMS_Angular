export class StaffMember {
    // Personal Information
    id!: string; 
    name!: string; 
    address!: string; 
    phoneNumber!: string; 
    email!: string;
    image!: string;

    // Job Details
    role!: string; 
    hireDate!: Date; 
    employmentStatus!: string; 
    shiftSchedule!: string; 
    salary!: number;
    skills!: string[];
    availability!: string; 
    leaveRecords!: string[];
}