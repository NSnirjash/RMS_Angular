import { Component } from '@angular/core';
import { StaffMember } from '../../../model/staff.model';
import { StaffService } from '../../../service/staff.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-createstaff',
  templateUrl: './createstaff.component.html',
  styleUrl: './createstaff.component.css'
})
export class CreatestaffComponent {
  newStaff: StaffMember = new StaffMember();

  employmentStatusOptions = ['Active', 'Not Active'];
  availabilityOptions = ['Available', 'Not Available'];

  constructor(private staffService: StaffService,
    private router: Router) {

  }

  createStaff() {
    this.staffService.createStaff(this.newStaff).subscribe(() => {
      this.router.navigate(['/show-staff']);
    });
  }

}
