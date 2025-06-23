// Translation utility functions
export type Locale = 'en' | 'es' | 'fr' | 'de';

// Import all translation files
import en from './en.json';
import es from './es.json';
import fr from './fr.json';
import de from './de.json';

// Map locales to their translation objects
const translations = { en, es, fr, de };

/**
 * Get translations for a specific locale
 * @param locale - The locale to get translations for
 * @returns Translation object for the specified locale
 */
export function getTranslations(locale: Locale = 'en') {
  return translations[locale] || translations.en;
}

/**
 * Get a specific translation by key path
 * @param locale - The locale to get translation for
 * @param keyPath - Dot-separated path to the translation key (e.g., 'hero.title')
 * @param fallback - Fallback text if translation is not found
 * @returns The translated text or fallback
 */
export function t(locale: Locale, keyPath: string, fallback?: string): string {
  const translations = getTranslations(locale);
  const keys = keyPath.split('.');
  
  let value: any = translations;
  for (const key of keys) {
    value = value?.[key];
    if (value === undefined) break;
  }
  
  return value || fallback || keyPath;
}

/**
 * Get the current locale from Astro context
 * @param astroLocale - Astro.currentLocale value
 * @returns Valid locale or default 'en'
 */
export function getCurrentLocale(astroLocale: string | undefined): Locale {
  if (astroLocale && ['en', 'es', 'fr', 'de'].includes(astroLocale)) {
    return astroLocale as Locale;
  }
  return 'en';
}