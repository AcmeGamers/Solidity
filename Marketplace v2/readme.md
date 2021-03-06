# NFT Marketplace V2

This is another marketplace for NFTs that is based on the ERC721 token standard.

This is a [Next.js](https://nextjs.org/) project bootstrapped with [`create-next-app`](https://github.com/vercel/next.js/tree/canary/packages/create-next-app).

## Getting Started

First, run the development server:

```bash
npm run dev
# or
yarn dev
```

Open [http://localhost:3000](http://localhost:3000) with your browser to see the result.

You can start editing the page by modifying `pages/index.js`. The page auto-updates as you edit the file.

[API routes](https://nextjs.org/docs/api-routes/introduction) can be accessed on [http://localhost:3000/api/hello](http://localhost:3000/api/hello). This endpoint can be edited in `pages/api/hello.js`.

The `pages/api` directory is mapped to `/api/*`. Files in this directory are treated as [API routes](https://nextjs.org/docs/api-routes/introduction) instead of React pages.

## Learn More

To learn more about Next.js, take a look at the following resources:

- [Next.js Documentation](https://nextjs.org/docs) - learn about Next.js features and API.
- [Learn Next.js](https://nextjs.org/learn) - an interactive Next.js tutorial.

You can check out [the Next.js GitHub repository](https://github.com/vercel/next.js/) - your feedback and contributions are welcome!

## Deploy on Vercel

The easiest way to deploy your Next.js app is to use the [Vercel Platform](https://vercel.com/new?utm_medium=default-template&filter=next.js&utm_source=create-next-app&utm_campaign=create-next-app-readme) from the creators of Next.js.

Check out our [Next.js deployment documentation](https://nextjs.org/docs/deployment) for more details.

## Modules

### Front-End / Back-End

- [React](https://reactjs.org/)
- [Next](https://nextjs.org/)
- [SASS](https://sass-lang.com/)
- [Tailwind CSS](https://tailwindcss.com/)
- [Font Awesome](https://fontawesome.com/)
- [Material UI](https://material-ui.com/)

### Other

- [@openzeppelin/contracts](https://www.npmjs.com/package/@openzeppelin/contracts)
- [Chai](https://www.npmjs.com/package/chai)
- [Chai-As-Promised](https://www.npmjs.com/package/chai-as-promised)
- [ethers](https://www.npmjs.com/package/ethers)

## Truffle Commands

Build the contracts:

```bash
truffle build
```

Compile the contracts:

```bash
truffle compile
```

Something is messed up.

```bash
truffle migrate --reset --compile-all
```

<!--
Deploy the contracts:

```bash
truffle migrate --network rinkeby
```

Deploy the contracts to the Rinkeby test network:

```bash
truffle migrate --network rinkeby --reset
```
-->

