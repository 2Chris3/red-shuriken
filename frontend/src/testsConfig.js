import { render, screen } from '@testing-library/react';
import userEvent from '@testing-library/user-event';
import { vi } from 'vitest';
import '@testing-library/jest-dom';

// make helpers global
globalThis.render = render;
globalThis.screen = screen;
globalThis.userEvent = userEvent;
globalThis.vi = vi; // for mocks, spies, timers, etc.
