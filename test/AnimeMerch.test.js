const chai = require("chai");
var assert = chai.assert;
const AnimeMerch = artifacts.require("./AnimeMerch");

// Checking for Chai
require("chai").use(require("chai-as-promised")).should();

contract("AnimeMerch", (accounts) => {
  let k;
  before(async () => {
    // k = await AnimeMerch.deployed();
    k = await AnimeMerch;
  });

  describe("AnimeMerch", () => {
    it("Deployed Sucessfully", async () => {
      let address = k.address;
      assert.notEqual(address, "");
      assert.notEqual(address, null);
      assert.notEqual(address, undefined);
      assert.notEqual(address, 0x0);
    });
    it("Has Name", async () => {
      let name = await k.name();
      assert.equal(name, "AnimeMerch");
    });
    it("Has Symbol", async () => {
      let symbol = await k.symbol();
      assert.equal(symbol, "AM");
    });
  });

  describe("minting", async () => {
    it("Creates a new token", async () => {
      const mint = await k.mint("https...1"),
        totalSupply = await k.totalSupply();

      // Success Region
      assert.equal(totalSupply, 1);
      const event = mint.logs[0].args;
      assert.equal(
        event._from,
        "0x0000000000000000000000000000000000000000",
        "Event passed from the contract"
      );
      assert.equal(event._to, accounts[0], "Obtained by msg.sender");

      // failure
      await k.mint("https...1").should.be.rejected;
    });
  });

  describe("Indexing", async () => {
    it("Lists of AnimeMerch", async () => {
      await k.mint("https...2");
      await k.mint("https...3");
      await k.mint("https...4");
      let totalSupply_2 = await k.totalSupply(),
        result = [],
        AnimeMerch,
        expected = ["https...1", "https...2", "https...3", "https...4"];

      for (let i = 1; i <= totalSupply_2; i++) {
        AnimeMerch = await k.AnimeMerch(i - 1);
        result.push(AnimeMerch);
        // result.push(await k.AnimeMerch(i - 1));
        // result.push("1");
      }

      assert.equal(
        result.length,
        expected.length,
        `Lists compiled succesfully, all the contracts are in the list. \nResult = ${result}\nExpected = ${expected}`
      );
    });
  });
});
