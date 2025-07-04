import { useState } from 'react';
import './App.css';

function App() {
  const [count, setCount] = useState<number>(0);

  return (
    <div className="app">
      <div className="card">
        <h1>🚀 Contador CI/CD</h1>
        <p className="number">{count}</p>
        <div className="buttons">
          <button className="btn increment" onClick={() => setCount(count + 1)}>Incrementar</button>
          <button className="btn decrement" onClick={() => setCount(count - 1)}>Decrementar</button>
          <button className="btn reset" onClick={() => setCount(0)}>Resetar</button>
        </div>
      </div>
    </div>
  );
}

export default App;
