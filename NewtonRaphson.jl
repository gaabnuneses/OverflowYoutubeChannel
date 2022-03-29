# Funções para calcular f(x) e f'(x)
# ln(x) + sin(x)
function f(x)
    # y = x²-2
    y = 1/x + cos(x)
    return y
end

function df(x)
    dy = -1/x^2 - sin(x)
    return dy
end

# Função para cálculo da raiz via Newton-Raphson
function newtonRaphson(xo,erro_min,nIt_max)
    xk = xo
    for it = 1:nIt_max
        xk = xk - f(xk)/df(xk)
        yk = f(xk)
        if abs(yk) <= erro_min
            println("Número de iteração final = $it")
            break
        end
    end

    return xk
end

xo = 1
erro_min = 10^(-10)
nIt_max = 10
raiz = newtonRaphson(xo, erro_min, nIt_max)

using Plots

X = 0.01:.01:5
Y = log.(X) + sin.(X)
dY = 1 ./(X) + cos.(X)
plot(X,dY,ylim=([-1,1]))
scatter!([raiz],[0])
plot!(X,dY*0,color="black",ls=:dash)
