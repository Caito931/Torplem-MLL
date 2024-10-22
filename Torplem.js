// Torplem.js
// Uma Biblioteca Matemática em JavaScripts
// Feito Por Caio Victor 2024

class Torplem {
    // Operações Básicas
    static soma(a, b) {
        return a + b;
    }

    static subtracao(a, b) {
        return a - b;
    }

    static multiplicacao(a, b) {
        return a * b;
    }

    static divisao(a, b) {
        if (b === 0) {
            throw new Error("Divisão por zero não é permitida");
        }
        return a / b;
    }

    // Propriedades dos Números
    static verificarParImpar(a) {
        return a % 2 === 0 ? "Par" : "Ímpar";
    }

    static verificarPositivoNegativoZero(a) {
        if (a > 0) return "Positivo";
        if (a < 0) return "Negativo";
        return "Zero";
    }

    // Operações Avançadas
    static fatorial(n) {
        if (n < 0) {
            throw new Error("Fatorial não está definido para números negativos");
        }
        if (n === 0) return 1;
        return Array.from({length: n}, (_, i) => i + 1).reduce((acc, val) => acc * val, 1);
    }

    static verificarPrimo(n) {
        if (n <= 1) return false;
        for (let i = 2; i <= Math.sqrt(n); i++) {
            if (n % i === 0) return false;
        }
        return true;
    }

    static potencia(base, expoente) {
        return Math.pow(base, expoente);
    }

    static raizQuadrada(n) {
        if (n < 0) {
            throw new Error("Raiz quadrada de número negativo não é real");
        }
        return Math.sqrt(n);
    }

    // Operações com Arrays
    static maximo(arr) {
        if (!arr.length) {
            throw new Error("Array vazio");
        }
        return Math.max(...arr);
    }

    static minimo(arr) {
        if (!arr.length) {
            throw new Error("Array vazio");
        }
        return Math.min(...arr);
    }

    static media(arr) {
        if (!arr.length) {
            throw new Error("Array vazio");
        }
        return arr.reduce((acc, val) => acc + val, 0) / arr.length;
    }

    // MDC e MMC
    static mdc(a, b) {
        while (b !== 0) {
            [a, b] = [b, a % b];
        }
        return Math.abs(a);
    }

    static mmc(a, b) {
        return Math.abs(a * b) / this.mdc(a, b);
    }

    // Conversão de Ângulos
    static grausParaRadianos(angulo) {
        return angulo * Math.PI / 180;
    }

    static radianosParaGraus(radianos) {
        return radianos * 180 / Math.PI;
    }

    // Números Especiais
    static verificarNumeroPerfeito(n) {
        if (n <= 0) return false;
        return Array.from({length: n-1}, (_, i) => i + 1)
            .filter(i => n % i === 0)
            .reduce((acc, val) => acc + val, 0) === n;
    }

    // Conversão de Base
    static converterBase(num, base) {
        if (base < 2 || base > 36) {
            throw new Error("Base deve estar entre 2 e 36");
        }
        return num.toString(base).toUpperCase();
    }

    // Funções Estatísticas
    static calcularMediana(arr) {
        if (!arr.length) {
            throw new Error("Array vazio");
        }
        const sorted = [...arr].sort((a, b) => a - b);
        const mid = Math.floor(sorted.length / 2);
        return sorted.length % 2 === 0
            ? (sorted[mid - 1] + sorted[mid]) / 2
            : sorted[mid];
    }

    static fibonacci(n) {
        if (n <= 0) return [];
        if (n === 1) return [1];
        const fib = [1, 1];
        for (let i = 2; i < n; i++) {
            fib[i] = fib[i-1] + fib[i-2];
        }
        return fib;
    }

    // Geração de Números Aleatórios
    static gerarNumeroAleatorio(min, max) {
        return Math.floor(Math.random() * (max - min + 1)) + min;
    }

    // Novas Funções
    static desvioPadrao(arr) {
        if (arr.length <= 1) {
            throw new Error("Array precisa ter pelo menos 2 elementos");
        }
        const media = this.media(arr);
        const soma = arr.reduce((acc, val) => acc + Math.pow(val - media, 2), 0);
        return Math.sqrt(soma / (arr.length - 1));
    }

    static verificarNumeroArmstrong(n) {
        if (n < 0) return false;
        const str = n.toString();
        const numDigitos = str.length;
        const soma = str
            .split('')
            .reduce((acc, digit) => acc + Math.pow(parseInt(digit), numDigitos), 0);
        return soma === n;
    }

    static areaCirculo(raio) {
        if (raio < 0) {
            throw new Error("Raio não pode ser negativo");
        }
        return Math.PI * Math.pow(raio, 2);
    }

    static volumeEsfera(raio) {
        if (raio < 0) {
            throw new Error("Raio não pode ser negativo");
        }
        return (4/3) * Math.PI * Math.pow(raio, 3);
    }

    static verificarNumeroTriangular(n) {
        if (n < 0) return false;
        let i = 1;
        let triangular = 0;
        while (triangular < n) {
            triangular += i;
            if (triangular === n) return true;
            i++;
        }
        return false;
    }

    static sequenciaCollatz(n) {
        if (n <= 0) {
            throw new Error("Número inicial deve ser positivo");
        }
        const sequencia = [n];
        while (n !== 1) {
            n = n % 2 === 0 ? n / 2 : 3 * n + 1;
            sequencia.push(n);
        }
        return sequencia;
    }
}

export default Torplem;