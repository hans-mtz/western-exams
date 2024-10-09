# Western-Exams

The quarto `western-exams` format will shuffle the order of the choice answers randomly in an MCQ exam according to a prespecified seed. 

This format is a customized wrapper for the $\LaTeX$ document class [`exams`](https://ctan.org/pkg/exam) using the [`randomizechoices`](https://ctan.org/pkg/exam-randomizechoices) package. 

## Installing

```bash
quarto use template hans-mtz/western-exams
```

In your terminal, this command will install the extension and create a template quarto file that you can use as a starting place for your exam.

## Using

You can use $\LaTeX$ formatting or the quarto wrappers using the filter `latex-environment`. Check the template to see examples of questions.

$\LaTeX$ compatibility is handy because you can use your old exams. You can mix the formats, quarto will take care of it.

## Making Exam Versions

Change `set-seed` yaml parameter to have different exam versions. You can name your version by changing `exam-version` yaml parameter.

For example, to run version V111 associated with set-seed 777, you can run:

```bash
quarto render template.qmd -o template-V111.pdf -M exam-version:V111 -M set-seed:777
```
To render the answer keys use the same set-seed and add set the `print-keytable` yaml parameter to `true`. 

```bash
quarto render template.qmd -o template-AK-V111.pdf -M exam-version:V111 -M set-seed:777 -M print-keytable:true
```

### GNU Makefile

I include a `makefile` file so you can render three different versions of your exams with just one line of code.

```bash
make all
```
To render the corresponding answer keys run

```bash
make answers
```

The default is to assign `set-seed` 666 to A, 777 to B, 888 to C, and 999 to D. You can change your set-seed and the number of versions in the `makefile` file by changing the variables `VERSIONS` and `SEEDS`. The `makefile` will associate the seeds with the versions in order. The first seed with the first version and so on.

## MCQ Exam Assitant - GPT

Combine this template with the GPT [*MCQ Exam Assitant*](https://chat.openai.com/g/g-XSiym5xEf-mcq-exam-assistant) to increase your productivity.

## Gradescope

This version's instructions are updated to be used with Gradescope Bubble Sheets.