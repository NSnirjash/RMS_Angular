import { Component } from '@angular/core';
import { StaffMember } from '../../../model/staff.model';
import { StaffService } from '../../../service/staff.service';

@Component({
  selector: 'app-showstaff',
  templateUrl: './showstaff.component.html',
  styleUrl: './showstaff.component.css'
})
export class ShowstaffComponent {

  staffMembers: StaffMember[] = [];

  constructor(private staffService: StaffService) { 

  }

  ngOnInit(): void {
    this.staffService.getStaff().subscribe(data => {
      this.staffMembers = data;
    });
  }

  deleteStaff(id: string): void {
    this.staffService.deleteStaff(id).subscribe(() => {
      this.staffMembers = this.staffMembers.filter(staff => staff.id !== id);
    });
  }
}
