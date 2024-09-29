import { TestBed } from '@angular/core/testing';

import { ApproveorderService } from './approveorder.service';

describe('ApproveorderService', () => {
  let service: ApproveorderService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(ApproveorderService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
