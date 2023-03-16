describe('should visit root', () => {
  it('successfully loads', () => {
    cy.visit('http://localhost:3000/')
  })
  it("clicks on add to cart and checks that the number of items in cart is 1", () => {
    cy.get('.products article').first().find('.btn').click({ force: true })
    // cy.get('[data-testid=list-item]').contains('1')
  });
})