import { render, screen } from '@testing-library/react';
import Example from './Example';

test('renders Example component', () => {
  render(<Example />);
  expect(screen.getByText('Example component')).toBeInTheDocument();
});
