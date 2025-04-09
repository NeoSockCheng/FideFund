import express from 'express';
import {
  createDonation,
  getDonations,
  releaseFunds,
} from '../controllers/donationController';

const router = express.Router();

// router.post('/', createDonation);
// router.get('/', getDonations);
// router.post('/release', releaseFunds);

export default router;
