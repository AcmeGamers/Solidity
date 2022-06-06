// Load dependencies
const { expect } = require("chai");

// Load compiled artifacts
const Anime = artifacts.require("Anime");

// Start test block
contract("Anime", function () {
  beforeEach(async function () {
    // Deploy a new Anime contract for each test
    this.Anime = await Anime.new();
  });

  // Test case
  it("retrieve returns a value previously stored", async function () {
    // Store a value
    await this.Anime.store(42);

    // Test if the returned value is the same one
    // Note that we need to use strings to compare the 256 bit integers
    expect((await this.Anime.retrieve()).toString()).to.equal("42");
  });
});
