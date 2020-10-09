using System;
using Xunit;
using Bookstore;

namespace BookstoreTests
{
    public class SampleTest
    {
        [Fact]
        public void TestCase1()
        {
            Assert.Equal("Hello World!", Greeting.MESSAGE);
        }
    }
}
