## pandoc-job-application
creates a cover-letter and cv using pandoc

### how to use
1. install [pandoc](https://pandoc.org/installing.html)
2. run `filer-watcher.ps1`
3. create your own job-application based on `pandoc-input/job-application-draft.md` or fill in `pandoc-input/job-application-empty.md`
4. grab your finished HTML file from the `pandoc-output` folder
5. print as PDF

### customizing template
the template is optimized for my cover-letter and cv, but it can be easily customized by changing the grid-layouts in `sccs/app.scss`.

### credits
`file-watcher.ps1` inspired by https://github.com/jamct/panTexter
