import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import CheckoutForm from '../components/CheckoutForm';
import { Typography, CircularProgress } from '@mui/material';

function Checkout({ cartItems }) {
  const navigate = useNavigate();
  const [orderCreated, setOrderCreated] = useState(false);
  const [errorMessage, setErrorMessage] = useState('');
  const [loading, setLoading] = useState(false);

  const handleSubmit = async formData => {
    setLoading(true);

    try {
      setTimeout(() => {
        setLoading(false);
        setOrderCreated(true);
        navigate('/order-success');
      }, 1);

    } catch (error) {
      console.error('Error creating order:', error);
      setLoading(false);
      setErrorMessage('An error occurred');
    }
  };

  return (
    <div className="checkout-container">
      {orderCreated ? (
        <Typography variant="h4" gutterBottom>
          Thank you for your order! You will be redirected shortly.
        </Typography>
      ) : (
        <>
          {loading && <CircularProgress />}
          {errorMessage && <Typography color="error">{errorMessage}</Typography>}
          <CheckoutForm onSubmit={handleSubmit} />
        </>
      )}
    </div>
  );
}

export default Checkout;
