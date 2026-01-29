import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';

// https://vite.dev/config/
export default defineConfig({
  plugins: [
    react({
      babel: {
        plugins: [['babel-plugin-react-compiler']],
      },
    }),
  ],
  test: {
    globals: true, // permet d'utiliser `describe`, `it`, `expect` sans les importer
    environment: 'jsdom', // simule un environnement navigateur pour les composants React
    include: ['./src/**/*.test.{js,jsx,ts,tsx}'], // quels fichiers tester
    setupFiles: './src/testsConfig.js', // fichier de configuration optionnel pour Testing Library ou jest-dom
    testTimeout: 5000, // durée maximale d'un test en millisecondes (5 secondes)
    mockReset: true, // réinitialise automatiquement les mocks entre chaque test
    coverage: {
      reporter: ['text', 'html'], // affiche le rapport de couverture dans le terminal et en HTML
    }
  },
  build: {
    outDir: 'prod' // default is 'dist'
  }
})
