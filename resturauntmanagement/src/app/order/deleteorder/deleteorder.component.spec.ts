import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DeleteorderComponent } from './deleteorder.component';

describe('DeleteorderComponent', () => {
  let component: DeleteorderComponent;
  let fixture: ComponentFixture<DeleteorderComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [DeleteorderComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(DeleteorderComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
