#!/usr/bin/env bash
set -e

COMPONENT_NAME=$1

if [ -z "$COMPONENT_NAME" ]; then
  echo "Usage: $0 <ComponentName>"
  exit 1
fi

# Chemin relatif et création du dossier
COMPONENT_DIR="$(dirname "$0")/../src/components/$COMPONENT_NAME"
mkdir -p "$COMPONENT_DIR"

# Chemin absolu (optionnel mais pratique)
COMPONENT_DIR="$(cd "$COMPONENT_DIR" && pwd)"

# -------- JSX --------
cat <<EOL > "$COMPONENT_DIR/$COMPONENT_NAME.jsx"
import React from 'react';
import './$COMPONENT_NAME.scss';

const $COMPONENT_NAME = () => {
  return (
    <div className="$COMPONENT_NAME">
      $COMPONENT_NAME component
    </div>
  );
};

export default $COMPONENT_NAME;
EOL

# -------- SCSS --------
touch "$COMPONENT_DIR/$COMPONENT_NAME.scss"

# -------- Test --------
cat <<EOL > "$COMPONENT_DIR/$COMPONENT_NAME.test.jsx"
import { render, screen } from '@testing-library/react';
import $COMPONENT_NAME from './$COMPONENT_NAME';

test('renders $COMPONENT_NAME component', () => {
  render(<$COMPONENT_NAME />);
  expect(screen.getByText('$COMPONENT_NAME component')).toBeInTheDocument();
});
EOL

# -------- index.js --------
cat <<EOL > "$COMPONENT_DIR/index.js"
export { default } from './$COMPONENT_NAME';
EOL

# -------- Storybook --------
cat <<EOL > "$COMPONENT_DIR/$COMPONENT_NAME.stories.jsx"
import React from 'react';
import $COMPONENT_NAME from './$COMPONENT_NAME';

export default {
  title: 'Components/$COMPONENT_NAME',
  component: $COMPONENT_NAME,
};

export const Default = () => <$COMPONENT_NAME />;
EOL

echo "✅ Composant $COMPONENT_NAME créé dans $COMPONENT_DIR"
