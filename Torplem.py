# Torplem.py
# Uma Biblioteca Matemática em Python
# Feito Por Caio Victor 2024

import math
import random
from typing import List, Union, Tuple

class Torplem:
    @staticmethod
    def soma(a: float, b: float) -> float:
        return a + b

    @staticmethod
    def subtracao(a: float, b: float) -> float:
        return a - b

    @staticmethod
    def multiplicacao(a: float, b: float) -> float:
        return a * b

    @staticmethod
    def divisao(a: float, b: float) -> float:
        if b == 0:
            raise ValueError("Divisão por zero não é permitida")
        return a / b

    @staticmethod
    def verificar_par_impar(a: int) -> str:
        return "Par" if a % 2 == 0 else "Ímpar"

    @staticmethod
    def verificar_positivo_negativo_zero(a: float) -> str:
        if a > 0:
            return "Positivo"
        elif a < 0:
            return "Negativo"
        return "Zero"

    @staticmethod
    def fatorial(n: int) -> int:
        if n < 0:
            raise ValueError("Fatorial não está definido para números negativos")
        if n == 0:
            return 1
        return math.factorial(n)

    @staticmethod
    def verificar_primo(n: int) -> bool:
        if n <= 1:
            return False
        return all(n % i != 0 for i in range(2, int(math.sqrt(n)) + 1))

    @staticmethod
    def potencia(base: float, expoente: float) -> float:
        return math.pow(base, expoente)

    @staticmethod
    def raiz_quadrada(n: float) -> float:
        if n < 0:
            raise ValueError("Raiz quadrada de número negativo não é real")
        return math.sqrt(n)

    @staticmethod
    def maximo(arr: List[float]) -> float:
        if not arr:
            raise ValueError("Array vazio")
        return max(arr)

    @staticmethod
    def minimo(arr: List[float]) -> float:
        if not arr:
            raise ValueError("Array vazio")
        return min(arr)

    @staticmethod
    def media(arr: List[float]) -> float:
        if not arr:
            raise ValueError("Array vazio")
        return sum(arr) / len(arr)

    @staticmethod
    def mdc(a: int, b: int) -> int:
        return math.gcd(abs(a), abs(b))

    @staticmethod
    def mmc(a: int, b: int) -> int:
        return abs(a * b) // math.gcd(a, b)

    @staticmethod
    def graus_para_radianos(angulo: float) -> float:
        return math.radians(angulo)

    @staticmethod
    def radianos_para_graus(radianos: float) -> float:
        return math.degrees(radianos)

    @staticmethod
    def verificar_numero_perfeito(n: int) -> bool:
        if n <= 0:
            return False
        return sum(i for i in range(1, n) if n % i == 0) == n

    @staticmethod
    def converter_base(num: int, base: int) -> str:
        if not 2 <= base <= 36:
            raise ValueError("Base deve estar entre 2 e 36")
        if num == 0:
            return "0"
        
        digitos = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        negativo = num < 0
        num = abs(num)
        resultado = ""
        
        while num:
            resultado = digitos[num % base] + resultado
            num //= base
            
        return f"-{resultado}" if negativo else resultado

    @staticmethod
    def calcular_mediana(arr: List[float]) -> float:
        if not arr:
            raise ValueError("Array vazio")
        
        sorted_arr = sorted(arr)
        n = len(sorted_arr)
        mid = n // 2
        
        return (sorted_arr[mid] + sorted_arr[mid-1]) / 2 if n % 2 == 0 else sorted_arr[mid]

    @staticmethod
    def fibonacci(n: int) -> List[int]:
        if n <= 0:
            return []
        elif n == 1:
            return [1]
        
        fib = [1, 1]
        for i in range(2, n):
            fib.append(fib[i-1] + fib[i-2])
        return fib

    @staticmethod
    def gerar_numero_aleatorio(min_val: int, max_val: int) -> int:
        return random.randint(min_val, max_val)

    @staticmethod
    def desvio_padrao(arr: List[float]) -> float:
        if len(arr) <= 1:
            raise ValueError("Array precisa ter pelo menos 2 elementos")
        return math.sqrt(sum((x - Torplem.media(arr)) ** 2 for x in arr) / (len(arr) - 1))

    @staticmethod
    def verificar_numero_armstrong(n: int) -> bool:
        if n < 0:
            return False
        str_n = str(n)
        num_digitos = len(str_n)
        return sum(int(d) ** num_digitos for d in str_n) == n

    @staticmethod
    def area_circulo(raio: float) -> float:
        if raio < 0:
            raise ValueError("Raio não pode ser negativo")
        return math.pi * raio ** 2

    @staticmethod
    def volume_esfera(raio: float) -> float:
        if raio < 0:
            raise ValueError("Raio não pode ser negativo")
        return (4/3) * math.pi * raio ** 3

    @staticmethod
    def verificar_numero_triangular(n: int) -> bool:
        if n < 0:
            return False
        i = 1
        triangular = 0
        while triangular < n:
            triangular += i
            if triangular == n:
                return True
            i += 1
        return False

    @staticmethod
    def sequencia_collatz(n: int) -> List[int]:
        if n <= 0:
            raise ValueError("Número inicial deve ser positivo")
        sequencia = [n]
        while n != 1:
            n = n // 2 if n % 2 == 0 else 3 * n + 1
            sequencia.append(n)
        return sequencia