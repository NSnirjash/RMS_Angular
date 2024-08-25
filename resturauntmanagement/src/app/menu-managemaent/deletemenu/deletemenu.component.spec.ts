import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DeletemenuComponent } from './deletemenu.component';

describe('DeletemenuComponent', () => {
  let component: DeletemenuComponent;
  let fixture: ComponentFixture<DeletemenuComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [DeletemenuComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(DeletemenuComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
