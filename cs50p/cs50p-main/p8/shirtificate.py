# Problem Set 8 - Shirtificate

from fpdf import FPDF

def main():
    insert(input("Text: "))

def insert(s):
    pdf = FPDF(orientation="portrait", format="A4")
    pdf.add_page()
    pdf.image("shirtificate.png", x=15, y=60, w=180, h=200)
    pdf.set_font('helvetica', size=52)
    pdf.cell(txt="CS50 Shirtificate", align="C")
    pdf.set_font('helvetica', size=15)
    pdf.cell(txt=s, align="C")
    pdf.output("shirtificate.pdf")

if __name__ == "__main__":
    main()