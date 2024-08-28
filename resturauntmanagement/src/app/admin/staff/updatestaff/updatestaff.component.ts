import { Component } from '@angular/core';
import { StaffMember } from '../../../model/staff.model';
import { StaffService } from '../../../service/staff.service';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'app-updatestaff',
  templateUrl: './updatestaff.component.html',
  styleUrl: './updatestaff.component.css'
})
export class UpdatestaffComponent {
  staff: StaffMember = new StaffMember();

  employmentStatusOptions = ['Active', 'Not Active'];
  availabilityOptions = ['Available', 'Not Available'];

  constructor(
    private staffService: StaffService,
    private route: ActivatedRoute,
    private router: Router
  ) { }

  ngOnInit(): void {
    const id = this.route.snapshot.paramMap.get('id');
    if (id) {
      this.staffService.getStaffById(id).subscribe((data: StaffMember) => {
        this.staff = data;
      });
    }
  }

  updateStaff() {
    this.staffService.updateStaff(this.staff.id, this.staff).subscribe(() => {
      this.router.navigate(['/show-staff']);
    });
  }
}
