# JC Kim's Profile Card

## How to Import Compressed Inline Tailwind CSS for Performance

To improve the performance of your homepage using Tailwind CSS, you can compress the CSS and include it as inline styles in your HTML file. Follow these steps to achieve this:

### 1. Install `tailwindcss` and `clean-css-cli`

Install `clean-css-cli` globally to compress and minify your CSS:

```bash
npm install -g tailwindcss clean-css-cli
```

### 2. Build and compress your Tailwind CSS

In your existing Tailwind CSS project, build and compress the CSS using `tailwindcss` and `clean-css-cli`:

```bash
npx tailwindcss build -c tailwind.config.js -o output.css && cleancss -o tailwind.min.css output.css
```

### 3. Inline the compressed CSS in your HTML file

Open your `output.min.css` file, copy its content, and paste it into your HTML file as inline CSS within a `<style>` tag.

Remember to rebuild and update the inline CSS in your HTML file whenever you make changes to your Tailwind CSS configuration or custom styles.
