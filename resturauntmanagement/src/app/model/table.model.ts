// table.model.ts
export class Table {
    id!: string;               // Unique identifier for the table
    name!: string;             // Name or number of the table (e.g., "Table 1")
    capacity!: string;         // Number of people the table can accommodate
    status!: 'available' | 'occupied' | 'reserved'|'requested'; // Current status of the table
    reservationTime!: Date |null;   // Optional: If the table is reserved, this holds the reservation time
    isApproved!: boolean;
  }
  