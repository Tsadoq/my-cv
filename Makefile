# Build the CV locally (XeLaTeX via latexmk). CI runs the same compile.
#   make          build cv.pdf
#   make preview  render page-*.png at 110 dpi (needs poppler: brew install poppler)
#   make check    extract text the way an ATS does and fail on non-ASCII hyphens
#   make clean    remove build artifacts

LATEXMK = latexmk -xelatex -interaction=nonstopmode -halt-on-error

.PHONY: all preview check check-only clean

all: cv.pdf

cv.pdf: cv.tex awesome-cv.cls fontawesome.sty resume/*.tex fonts/*
	$(LATEXMK) cv.tex

preview: cv.pdf
	rm -f page-*.png
	pdftoppm -png -r 110 cv.pdf page

check: cv.pdf check-only

# Same checks without triggering a rebuild (CI builds cv.pdf in a container first).
check-only:
	pdftotext -layout cv.pdf cv.txt
	@if grep -q $$'‑' cv.txt; then echo "FAIL: non-ASCII hyphens (U+2011) in extracted text"; exit 1; fi
	@if ! grep -q "Senior AI Engineer" cv.txt; then echo "FAIL: title did not extract in normal case"; exit 1; fi
	@pages=$$(pdfinfo cv.pdf | awk '/^Pages:/{print $$2}'); if [ "$$pages" -ne 2 ]; then echo "FAIL: expected 2 pages, got $$pages"; exit 1; fi
	@echo "OK: ASCII hyphens, titles extract cleanly, 2 pages"

clean:
	latexmk -C cv.tex
	rm -f page-*.png cv.txt missfont.log
