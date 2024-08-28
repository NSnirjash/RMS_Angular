import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { StaffMember } from '../model/staff.model';

@Injectable({
  providedIn: 'root'
})
export class StaffService {

  private apiUrl = 'http://localhost:3000/staff';
  constructor(private http: HttpClient) {

  }

  getStaff(): Observable<StaffMember[]> {
    return this.http.get<StaffMember[]>(this.apiUrl);
  }

  getStaffById(id: string): Observable<StaffMember> {
    return this.http.get<StaffMember>(`${this.apiUrl}/${id}`);
  }

  createStaff(staff: StaffMember): Observable<StaffMember> {
    return this.http.post<StaffMember>(this.apiUrl, staff);
  }

  updateStaff(id: string, staff: StaffMember): Observable<StaffMember> {
    return this.http.put<StaffMember>(`${this.apiUrl}/${id}`, staff);
  }

  deleteStaff(id: string): Observable<void> {
    return this.http.delete<void>(`${this.apiUrl}/${id}`);
  }
}
