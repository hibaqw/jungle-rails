describe('should visit root', () => {
  it('successfully loads', () => {
    cy.visit('http://localhost:3000/')
  })
  it("clicks on first product and redirects user to products page", () => {
    cy.get(".products article").first().click()
    cy.location('pathname').should('eq', '/products/12') 
  });
})