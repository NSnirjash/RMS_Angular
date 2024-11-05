import { Component } from '@angular/core';
import { Table } from '../model/table.model';
import { TablemanagementService } from '../service/tablemanagement.service';

@Component({
  selector: 'app-tablemanagement',
  templateUrl: './tablemanagement.component.html',
  styleUrl: './tablemanagement.component.css'
})
export class TablemanagementComponent {

  tables: Table[] = [];
  reservationDateTime: Date = new Date();  // Store reservation date and time

  constructor(private tableService: TablemanagementService) {}

  ngOnInit(): void {
    this.loadTables();
  }

  loadTables(): void {
    this.tableService.getTables().subscribe((data: Table[]) => {
      this.tables = data;
    });
  }

  requestReservation(table: Table): void {
    this.tableService.requestReservation(table, this.reservationDateTime).subscribe(() => {
      this.loadTables();
    });
  }
}
