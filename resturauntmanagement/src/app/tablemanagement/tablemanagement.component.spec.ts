import { ComponentFixture, TestBed } from '@angular/core/testing';

import { TablemanagementComponent } from './tablemanagement.component';

describe('TablemanagementComponent', () => {
  let component: TablemanagementComponent;
  let fixture: ComponentFixture<TablemanagementComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [TablemanagementComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(TablemanagementComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
