import express from 'express';
import cors from 'cors';
import dotenv from 'dotenv';
import donationRoutes from './routes/donationRoutes';

dotenv.config();
const app = express();
const PORT = process.env.PORT || 5000;

app.use(cors());
app.use(express.json());

app.use('/api/donations', donationRoutes);

app.get('/', (req, res) => {
  res.send('FideFund API is running');
});

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});