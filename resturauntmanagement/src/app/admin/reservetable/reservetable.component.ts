import { Component } from '@angular/core';
import { Table } from '../../model/table.model';
import { TablemanagementService } from '../../service/tablemanagement.service';

@Component({
  selector: 'app-reservetable',
  templateUrl: './reservetable.component.html',
  styleUrl: './reservetable.component.css'
})
export class ReservetableComponent {

  tables: Table[] = [];
  

  constructor(private tableService: TablemanagementService) {

  }

  ngOnInit(): void {
    this.loadTables();
  }

  loadTables(): void {
    this.tableService.getTables().subscribe((data: Table[]) => {
      this.tables = data;
    });
  }

  approveReservation(table: Table): void {
    this.tableService.approveReservation(table).subscribe(() => {
      this.loadTables();
    });
  }

  deleteReservation(table: Table): void {
    this.tableService.deleteReservation(table).subscribe(() => {
      this.loadTables();
    });
  }

  freeTable(table: Table): void {
    this.tableService.freeTable(table).subscribe(() => {
      this.loadTables();
    });
  }
}
