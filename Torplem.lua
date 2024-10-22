-- Torplem.lua
-- Uma Biblioteca Matemática em Lua
-- Feito Por Caio Victor 2024

local Torplem = {}

-- Basic Operations
function Torplem.Soma(a, b)
    return a + b
end

function Torplem.Subtracao(a, b)
    return a - b
end

function Torplem.Multiplicacao(a, b)
    return a * b
end

function Torplem.Divisao(a, b)
    if b == 0 then
        error("Divisao por zero nao e permitida")
    end
    return a / b
end

function Torplem.JurosSimples(c, i, t) 
    local resultado = (c * i * t) / 100
    return resultado
end

function Torplem.Montante(c, j) 
    return (c + j)
end

function Torplem.Porcentagem(total, porcento) 
    return (total * porcento) / 100
end



-- Number Properties
function Torplem.ehParouImpar(a)
    return a % 2 == 0 and "Par" or "Impar"
end

function Torplem.VerificarPositivoNegativoZero(a)
    if a > 0 then
        return "Positivo"
    elseif a < 0 then
        return "Negativo"
    else
        return "Zero"
    end
end

-- Advanced Operations
function Torplem.Fatorial(n)
    if n < 0 then
        error("Fatorial não está definido para números negativos")
    end
    if n == 0 then
        return 1
    end
    local result = 1
    for i = 1, n do
        result = result * i
    end
    return result
end

function Torplem.VerificarPrimo(n)
    if n <= 1 then
        return false
    end
    for i = 2, math.sqrt(n) do
        if n % i == 0 then
            return false
        end
    end
    return true
end

function Torplem.Potencia(base, expoente)
    return math.pow(base, expoente)
end

function Torplem.RaizQuadrada(n)
    if n < 0 then
        error("Raiz quadrada de numero negativo nao é real")
    end
    return math.sqrt(n)
end

-- Array Operations
function Torplem.Maximo(arr)
    if #arr == 0 then
        error("Array vazio")
    end
    local max = arr[1]
    for i = 2, #arr do
        if arr[i] > max then
            max = arr[i]
        end
    end
    return max
end

function Torplem.Minimo(arr)
    if #arr == 0 then
        error("Array vazio")
    end
    local min = arr[1]
    for i = 2, #arr do
        if arr[i] < min then
            min = arr[i]
        end
    end
    return min
end

function Torplem.Media(arr)
    if #arr == 0 then
        error("Array vazio")
    end
    local soma = 0
    for _, v in ipairs(arr) do
        soma = soma + v
    end
    return soma / #arr
end

-- GCD and LCM
function Torplem.MDC(a, b)
    while b ~= 0 do
        a, b = b, a % b
    end
    return math.abs(a)
end

function Torplem.MMC(a, b)
    return math.abs(a * b) / Torplem.MDC(a, b)
end

-- Angle Conversions
function Torplem.GrausParaRadianos(angulo)
    return angulo * math.pi / 180
end

function Torplem.RadianosParaGraus(radianos)
    return radianos * 180 / math.pi
end

-- Special Numbers
function Torplem.VerificarNumeroPerfeito(n)
    if n <= 0 then
        return false
    end
    local soma = 0
    for i = 1, n-1 do
        if n % i == 0 then
            soma = soma + i
        end
    end
    return soma == n
end

-- Base Conversion
function Torplem.ConverterBase(num, base)
    if base < 2 or base > 36 then
        error("Base deve estar entre 2 e 36")
    end
    if num == 0 then
        return "0"
    end
    
    local digits = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    local result = ""
    local n = math.abs(num)
    
    while n > 0 do
        local remainder = n % base
        result = string.sub(digits, remainder + 1, remainder + 1) .. result
        n = math.floor(n / base)
    end
    
    if num < 0 then
        result = "-" .. result
    end
    return result
end

-- Statistical Functions
function Torplem.CalcularMediana(arr)
    if #arr == 0 then
        error("Array vazio")
    end
    
    -- Create a copy of the array and sort it
    local sorted = {}
    for i, v in ipairs(arr) do
        sorted[i] = v
    end
    table.sort(sorted)
    
    local len = #sorted
    if len % 2 == 0 then
        return (sorted[len/2] + sorted[(len/2) + 1]) / 2
    else
        return sorted[math.ceil(len/2)]
    end
end

function Torplem.Fibonacci(n)
    if n <= 0 then
        return {}
    elseif n == 1 then
        return {1}
    end
    
    local fib = {1, 1}
    for i = 3, n do
        fib[i] = fib[i-1] + fib[i-2]
    end
    return fib
end

-- Random Number Generation
function Torplem.GerarNumeroAleatorio(min, max)
    return math.random(min, max)
end

function Torplem.DesenharGrafico(arr)
    local max_val = Torplem.Maximo(arr)
    local scale = 50 / max_val  -- Escala para que o gráfico caiba na linha

    for i, v in ipairs(arr) do
        local bar_length = math.floor(v * scale)
        io.write(string.format("%2d | ", v))
        for j = 1, bar_length do
            io.write("*")
        end
        print()
    end
    print("   +", string.rep("-", 50))
    print("   ", table.concat(arr, " "))
end

function Torplem.CriarTabela(titulo, cabecalhos, dados)
    print(titulo)
    for _, cabecalho in ipairs(cabecalhos) do
        io.write(cabecalho .. "\t")
    end
    print()
    
    for _, linha in ipairs(dados) do
        for _, valor in ipairs(linha) do
            io.write(valor .. "\t")
        end
        print()
    end
end



return Torplem