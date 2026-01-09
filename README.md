# Red Shuriken

Tester à tout moment
`npx vitest --run`

*npm ci + github actions ??????*

## Clean, smart, operational approach

1. Dev locally with HMR → fast iteration
2. Lint & test frequently → catch errors early
3. Build clean → rm -rf dist && npm run build
4. Preview production → ensure deployment works locally
5. Deploy → automated via Vercel/Netlify or manual upload
6. Automate using npm scripts + CI/CD → reduces human error

---

## Vite scripts dans l'ordre

1. npm run dev (local dev)
2. npm run prebuild (test, clean)
3. npm run build (bundles)
4. npm run postbuild (tasks, status, compression)
5. npm run preview (prod debugging)
6. npm run deploy (publish on a server)

## CI/CD

lint → test → build → deploy on every git push

[ DEV: npm run dev ]
        │ HMR & local server
        ▼
[ LINT & TEST: prebuild ]
        │ npm runs automatically before build
        ▼
[ BUILD: npm run build ]
        │ dist/ generated (overwrite if exists)
        ▼
[ POSTBUILD: npm run postbuild ]
        │ optional tasks (compress, info)
        ▼
[ PREVIEW: npm run preview ]
        │ check production locally
        ▼
[ DEPLOY: npm run deploy ]
        │ Vercel uploads dist/ to prod
