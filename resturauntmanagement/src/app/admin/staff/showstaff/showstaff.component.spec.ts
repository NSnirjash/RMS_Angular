import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ShowstaffComponent } from './showstaff.component';

describe('ShowstaffComponent', () => {
  let component: ShowstaffComponent;
  let fixture: ComponentFixture<ShowstaffComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ShowstaffComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ShowstaffComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
