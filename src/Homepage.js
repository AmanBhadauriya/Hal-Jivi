// Homepage.js

import React from 'react';
import { Link } from 'react-router-dom';

function Homepage() {
  return (
    <div>
      <h1>Welcome to Crop Cultivation Platform</h1>
      <p>This platform helps farmers in managing their cultivation activities, calculating MSP, and more.</p>
      <div>
        <Link to="/register">
          <button>Register</button>
        </Link>
        <Link to="/login">
          <button>Login</button>
        </Link>
      </div>
    </div>
  );
}

export default Homepage;
